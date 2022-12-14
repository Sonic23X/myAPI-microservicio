# Utilizar la imagen oficial de Python 3
FROM python:3

# Seleccionar el directorio donde trabajaremos
# Copiar el codigo fuente al directorio de trabajo
COPY . /usr/src/app
WORKDIR /usr/src/app

# Instalar flask y sus dependencias.
COPY ./app/programa.py ./
COPY ./app/requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Abrir el puerto 5000 del contendor
EXPOSE 5000

# Injectar variable de configuracion para flask
ENV FLASK_APP=app/programa.py

# Iniciar el servicio
CMD [ "flask", "run", "--host=0.0.0.0", "--port=5001" ]