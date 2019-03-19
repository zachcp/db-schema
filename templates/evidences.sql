--- DROP TABLE "{{DATABASE}}"."evidences";

CREATE TABLE "{{DATABASE}}"."evidences" (
    evidence_id	serial NOT NULL,
    name	text,
    description	text,
    CONSTRAINT evidences_pkey PRIMARY KEY (evidence_id),
    CONSTRAINT evidences_name_unique UNIQUE (name)
);
COMMENT ON TABLE "{{DATABASE}}"."evidences"
  IS 'A description of the evidence for existence of a gene or gene cluster.';

--- Taken from MIBiG. name fields should always be lower case.
INSERT INTO "{{DATABASE}}"."evidences" (name, description) VALUES
    ( 'knockout', 'Knock-out studies' ),
    ( 'enzymatic', 'Enzymatic assays' ),
    ( 'heterologous', 'Heterologous expression assays' ),
    ( 'correlation', 'Gene expression correlated with compound production' ),
    ( 'prediction', 'Sequence-based prediction' ),
    ( 'other', 'Other evidence' ),
    ( 'unknown', 'Unknown evidence level' );
