# Base image
FROM inseefrlab/onyxia-rstudio:r4.2.2

# Install required linux librairies
RUN apt-get update --yes && \
    apt-get install --yes libprotoc-dev libprotobuf-dev protobuf-compiler openjdk-17-jdk && \
    R CMD javareconf


# Install R package and its dependencies
RUN Rscript -e 'install.packages(c("RProtoBuf", "strucchange", "dygraphs","patchwork","forecast","car"))' && \
    Rscript -e 'remotes::install_github("palatej/rjd3toolkit")' && \
    Rscript -e 'remotes::install_github("palatej/rjd3sts")' && \
    Rscript -e 'remotes::install_github("AQLT/tvCoef")'
