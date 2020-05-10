FROM rocker/shiny

RUN R --slave -e "install.packages('remotes')"
RUN R --slave -e "remotes::install_github(c('rstudio/httpuv'))"

COPY app.R /srv/shiny-server/

COPY shiny-customized.config /etc/shiny-server/shiny-server.conf
#COPY shiny-server.conf  /etc/shiny-server/shiny-server.conf

EXPOSE 8080

# Copy further configuration files into the Docker image
COPY shiny-server.sh /usr/bin/shiny-server.sh

CMD ["/usr/bin/shiny-server.sh"]