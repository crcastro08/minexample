FROM rocker/shiny

RUN R --slave -e "install.packages('remotes')"
RUN R --slave -e "remotes::install_github(c('rstudio/httpuv'))"

COPY app.R /srv/shiny-server/app.R

COPY shiny-customized.config /etc/shiny-server/shiny-server.conf

EXPOSE 8080

USER shiny

CMD ["R", "-e", "shiny::runApp('/srv/shiny', host='0.0.0.0', port=8080, launch.browser = F)"]
