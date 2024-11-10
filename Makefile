VIRTUAL_ENV = ${ANSIBLE_VENV}
.PHONY: install push

.install:
	source $(VIRTUAL_ENV)/bin/activate && \
		cd ansible && \
		ansible-playbook --diff playbooksmain.yml --ask-become-pass && \
		cd ../

push:
	git push origin master
