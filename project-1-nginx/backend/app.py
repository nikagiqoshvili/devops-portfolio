import os

import psycopg
from flask import Flask, jsonify

app = Flask(__name__)


def get_database_connection():
    return psycopg.connect(
        host=os.environ["DB_HOST"],
        port=os.environ.get("DB_PORT", "5432"),
        dbname=os.environ["DB_NAME"],
        user=os.environ["DB_USER"],
        password=os.environ["DB_PASSWORD"],
    )


@app.get("/api")
def api():
    return jsonify(
        message="Backend API is working",
        project="Nika's DevOps Portfolio",
        status="success",
    )


@app.get("/health")
def health():
    return jsonify(status="healthy"), 200


@app.get("/db")
def database_test():
    try:
        with get_database_connection() as connection:
            with connection.cursor() as cursor:
                cursor.execute(
                    """
                    CREATE TABLE IF NOT EXISTS visits (
                        id INTEGER PRIMARY KEY,
                        visit_count INTEGER NOT NULL
                    )
                    """
                )

                cursor.execute(
                    """
                    INSERT INTO visits (id, visit_count)
                    VALUES (1, 1)
                    ON CONFLICT (id)
                    DO UPDATE SET visit_count = visits.visit_count + 1
                    RETURNING visit_count
                    """
                )

                visit_count = cursor.fetchone()[0]

        return jsonify(
            database="connected",
            message="PostgreSQL connection successful",
            visit_count=visit_count,
            status="success",
        )

    except Exception as error:
        app.logger.exception("Database connection failed")

        return jsonify(
            database="unavailable",
            message="PostgreSQL connection failed",
            error=str(error),
            status="error",
        ), 500


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
