VIRTUAL_ENV = ${ANSIBLE_VENV}

install:
	source $(VIRTUAL_ENV)/bin/activate && \
		ansible-playbook --diff main.yml --ask-become-pass

push:
	git push origin master
