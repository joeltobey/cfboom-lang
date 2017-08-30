FROM joeltobey/lucee:5.2-commandbox

# Create Lucee configs
COPY docker/lucee-server.xml /opt/lucee/server/lucee-server/context/lucee-server.xml
COPY docker/lucee-web.xml.cfm /opt/lucee/web/lucee-web.xml.cfm
COPY docker/log4j.properties /opt/lucee/web/log4j.properties

RUN cd /var/www && \
    box coldbox create app myapp && \
    box install testbox && \
    cd modules_app/ && \
    mkdir cfboom-lang/
