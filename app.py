import os
import sys
import sqlite3
from flask import Flask, request, jsonify, send_from_directory

app = Flask(__name__)

# =========================
# CONFIGURACIÓN DE RUTAS
# =========================

# ¿Estamos corriendo como .exe (PyInstaller)?
IS_FROZEN = getattr(sys, 'frozen', False)
BASE_DIR = sys._MEIPASS if IS_FROZEN else os.path.abspath(os.path.dirname(__file__))

# Carpeta donde están index.html, styles.css, app.js, manifest.json y assets/
STATIC_DIR = BASE_DIR

# =========================
# BASE DE DATOS REAL
# =========================
# Siempre usamos este nombre, como ya tienes:
#   C:\Users\TU_USUARIO\Documents\Nexus Finance\nexus_finance.db

USER_DOCS = os.path.join(os.path.expanduser("~"), "Documents")
DB_FOLDER = os.path.join(USER_DOCS, "Nexus Finance")
os.makedirs(DB_FOLDER, exist_ok=True)  # crea la carpeta si no existe

DB_PATH = os.path.join(DB_FOLDER, "nexus_finance.db")  # <-- NO CAMBIA EL NOMBRE

def get_db_connection():
    conn = sqlite3.connect(DB_PATH)
    conn.row_factory = sqlite3.Row
    return conn

# Aquí siguen TODAS tus rutas /movimientos, /status, etc.
# NO LAS TOQUES, solo asegúrate de que usan get_db_connection() o DB_PATH

# =========================
# RUTAS PARA LA WEB
# =========================

@app.route("/")
def serve_index():
    # Sirve el index.html desde STATIC_DIR (funciona en VSCode y en el .exe)
    return send_from_directory(STATIC_DIR, "index.html")

@app.route("/<path:path>")
def serve_static(path):
    # Sirve cualquier archivo estático: app.js, styles.css, manifest.json, assets/*
    return send_from_directory(STATIC_DIR, path)

# =========================
# ARRANQUE DE LA APP
# =========================

if __name__ == "__main__":
    import threading
    import webbrowser
    import time

    def open_browser():
        # Pequeña pausa para que Flask arranque
        time.sleep(1)
        webbrowser.open("http://127.0.0.1:5000/")

    # Abrir navegador en un hilo aparte
    threading.Thread(target=open_browser, daemon=True).start()

    # Ejecutar Flask SIN debug para producción
    app.run(host="127.0.0.1", port=5000, debug=False)
