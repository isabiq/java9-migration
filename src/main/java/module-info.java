module com.iluwatar.cqrs {
    requires hibernate.jpa;
    requires slf4j.api;
    requires hibernate.core;
    requires java.naming;
    requires javassist;
    requires java.sql;

    exports com.iluwatar.cqrs.commandes;
    exports com.iluwatar.cqrs.dto;
    exports com.iluwatar.cqrs.queries;

    opens com.iluwatar.cqrs.domain.model;
    opens com.iluwatar.cqrs.dto;

}
