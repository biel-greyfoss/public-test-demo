FROM tiangolo/uvicorn-gunicorn-fastapi:python3.8


RUN pip install fastapi uvicorn


EXPOSE 9000

COPY ./app /app

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "9000"]
