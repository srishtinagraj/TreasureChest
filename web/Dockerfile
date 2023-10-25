FROM google/dart

WORKDIR /app

COPY . .

RUN pub get

EXPOSE 8080

CMD ["pub", "run", "web:8080"]
