# sp-api

## Generate a Java SDK
- [ref](https://developer-docs.amazon.com/sp-api/docs/generating-a-java-sdk-with-lwa-token-exchange)
- java 17
  - version up lombok to latest version
  - `selling-partner-api-models/clients/sellingpartner-api-aa-java/pom.xml`

## How to
- `git clone https://github.com/amzn/selling-partner-api-models.git`
- command below
```sh
# generate model
java -jar ./tools/swagger-codegen-cli.jar generate \
-i ./selling-partner-api-models/models/sellers-api-model/sellers.json \
-l java \
-t ./selling-partner-api-models/clients/sellingpartner-api-aa-java/resources/swagger-codegen/templates/ \
-o ./sellers-javacl \
-c selling-partner-api-models/clients/sellingpartner-api-aa-java/resources/java/config.json

# install local maven repository
mvn install:install-file -Dfile=selling-partner-api-models/clients/sellingpartner-api-aa-java/target/sellingpartnerapi-aa-java-2.0-jar-with-dependencies.jar -DgroupId=com.amazon.sellingpartnerapi -DartifactId=sellingpartnerapi-aa-java -Dversion=1.0 -Dpackaging=jar -DgeneratePom=true

```