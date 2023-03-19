FROM python:3.9-slim-buster
RUN apt update -qq -y && apt install -qq -y git
RUN git clone https://github.com/NeuralRealm/StableFusion
WORKDIR StableFusion
RUN pip install torch && pip install stablefusion
RUN echo "cd StableFusion && stablefusion app --port 10000 --share" > entrypoint.sh
EXPOSE 10000
ENTRYPOINT ["/StableFusion/entrypoint.sh"]
