VERSION:=1.0

test: fmt init validate

i init:
	terraform init

v validate:
	terraform validate

f fmt:
	terraform fmt

release:
	git pull --tags
	git tag v$(VERSION)
	git push --tags
