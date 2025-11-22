# 1️⃣ Imagen base: Python 3.12 slim
FROM python:3.12-slim

# 2️⃣ Crear directorio de trabajo dentro del contenedor
WORKDIR /app

# 3️⃣ Copiar los archivos del proyecto al contenedor
COPY . /app

# 4️⃣ Instalar dependencias
RUN pip install --no-cache-dir -r requirements.txt

# 5️⃣ Exponer puerto 5000
EXPOSE 5000

# 6️⃣ Comando para ejecutar la app con Gunicorn
CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:5000"]
