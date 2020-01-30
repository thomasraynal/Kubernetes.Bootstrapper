# https://vsupalov.com/docker-arg-env-variable-guide/
ARG RUNTIME_IMAGE

FROM $RUNTIME_IMAGE AS final
WORKDIR /app
COPY . .
ARG BEEZUP_BUILD_ID
RUN echo $BEEZUP_BUILD_ID > BEEZUP_BUILD_ID.txt
ENV BEEZUP_BUILD_ID=$BEEZUP_BUILD_ID
EXPOSE 12000
EXPOSE 1337
EXPOSE 3333
EXPOSE 11111
EXPOSE 9090
EXPOSE 30000
ARG PROJECT_NAME
ENV RUN_PROJECT_NAME=$PROJECT_NAME
ENTRYPOINT dotnet $RUN_PROJECT_NAME.dll
