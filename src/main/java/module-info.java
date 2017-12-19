module com.iluwatar.cqrs {
    requires hibernate.jpa;
    requires slf4j.api;
    requires hibernate.core;
    requires java.naming;
    requires javassist;
    requires java.sql;
    requires activation;
    requires antlr;
    requires dom4j;
    requires h2;
    requires hibernate.commons.annotations;
    requires jandex;
    requires jaxb.api;
    requires jboss.logging;
    requires logback.classic;
    requires logback.core;

    exports com.iluwatar.cqrs.commandes;
    exports com.iluwatar.cqrs.dto;
    exports com.iluwatar.cqrs.queries;

    opens com.iluwatar.cqrs.domain.model;
    opens com.iluwatar.cqrs.dto;

}
