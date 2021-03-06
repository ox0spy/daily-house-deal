.PHONY: pip, fetch, clean, push

TZ:=Asia/Shanghai
export TZ

pip:
	pip install -r requirements.txt

fetch:
	@echo "Current datetime: $(shell date)"
	python daily_deal.py

push: fetch
	@echo "push latest csv file to github."
	bash ./push-to-github.sh

clean:
	@echo "make clean ..."
	@find ./ -name '*.pyc' -exec rm -f {} +
	@find ./ -name '*.pyo' -exec rm -f {} +
	@find ./ -name '*~' -exec rm -f {} +
	@find ./ -name '__pycache__' -exec rm -rf {} +
