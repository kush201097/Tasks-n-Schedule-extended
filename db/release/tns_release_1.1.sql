ALTER TABLE users
ADD CONSTRAINT users_roleid_FK
FOREIGN KEY(roleid)
REFERENCES userroles(id)

ALTER TABLE project
ADD CONSTRAINT project_orgid_FK
FOREIGN KEY(orgid)
REFERENCES organization(id)

ALTER TABLE users
ADD CONSTRAINT users_orgid_FK
FOREIGN KEY(orgid)
REFERENCES organization (id)

ALTER TABLE version
ADD CONSTRAINT version_projectid_FK
FOREIGN KEY(projectid)
REFERENCES project (id)

ALTER TABLE module
ADD CONSTRAINT module_projectid_FK
FOREIGN KEY(projectid)
REFERENCES project (id)

ALTER TABLE sprint
ADD CONSTRAINT sprint_projectid_FK
FOREIGN KEY(projectid)
REFERENCES project (id)

ALTER TABLE sprint
ADD CONSTRAINT sprint_versionid_FK
FOREIGN KEY(versionid)
REFERENCES version (id)

ALTER TABLE task
ADD CONSTRAINT task_projectid_FK
FOREIGN KEY(projectid)
REFERENCES project (id)

ALTER TABLE task
ADD CONSTRAINT task_priorityid_FK
FOREIGN KEY(priorityid)
REFERENCES taskpriority (id)

ALTER TABLE task
ADD CONSTRAINT task_typeid_FK
FOREIGN KEY(typeid)
REFERENCES tasktype (id)

ALTER TABLE task
ADD CONSTRAINT task_statusid_FK
FOREIGN KEY(statusid)
REFERENCES taskstatus (id)

ALTER TABLE comment
ADD CONSTRAINT comment_taskid_FK
FOREIGN KEY(taskid)
REFERENCES task (id)

ALTER TABLE comment
ADD CONSTRAINT comment_userid_FK
FOREIGN KEY(userid)
REFERENCES users (id)

ALTER TABLE license
ADD CONSTRAINT license_orgid_FK
FOREIGN KEY(orgid)
REFERENCES organization (id)

ALTER TABLE sprint_email_audit
ADD CONSTRAINT sprint_email_audit_sprintid_FK
FOREIGN KEY(sprintid)
REFERENCES sprint (id)

ALTER TABLE sprint_email_audit
ADD CONSTRAINT sprint_email_audit_userid_FK
FOREIGN KEY(userid)
REFERENCES users (id)