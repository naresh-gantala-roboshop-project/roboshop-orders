.PHONY: build run docker-build clean

build:
	mvn clean package -DskipTests

run:
	MONGO_URL=mongodb://localhost:27017/orders AMQP_HOST=localhost mvn spring-boot:run

docker-build:
	docker build -t nareshroboshop.azurecr.io/roboshop-orders:${IMAGE_TAG} .
	docker push nareshroboshop.azurecr.io/roboshop-orders:${IMAGE_TAG}

clean:
	mvn clean
