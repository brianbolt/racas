FROM mcneilco/centos-r-repo:1.13.5

COPY	--chown=runner:runner . /home/runner/racas
RUN  export R_LIBS=/home/runner/build/r_libs && R CMD INSTALL --no-multiarch --with-keep.source /home/runner/racas
EXPOSE 1080

RUN cp -R /home/runner/racas/inst/bin /home/runner/bin

CMD ["bin/acas.sh", "run", "rservices"]