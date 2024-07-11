
NAME=vikunja:latest

build:
	docker build -t $(NAME) .

run:
	docker run -it $(NAME) bash

release:
	mkdir -p dist
	docker run --volume $(PWD)/dist:/dist --rm $(NAME)
