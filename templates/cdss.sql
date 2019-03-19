CREATE TABLE "{{DATABASE}}"."cdss" (
    cds_id	serial NOT NULL,
    functional_class_id	int4,
    evidence_id	int4,
    locus_tag	text,
    name	text,
    product	text,
    protein_id	text,
    translation	text,
    locus_id	int4,
    operon_id	int4,
    CONSTRAINT cdss_pkey PRIMARY KEY (cds_id),
    CONSTRAINT cdss_functional_class_id_fkey FOREIGN KEY (functional_class_id) REFERENCES "{{DATABASE}}"."functional_classes" (functional_class_id),
    CONSTRAINT cdss_evidence_id_fkey FOREIGN KEY (evidence_id) REFERENCES "{{DATABASE}}"."evidences" (evidence_id),
    CONSTRAINT cdss_locus_id_fkey FOREIGN KEY (locus_id) REFERENCES "{{DATABASE}}"."loci" (locus_id) ON DELETE CASCADE,
    CONSTRAINT cdss_operon_id_fkey FOREIGN KEY (operon_id) REFERENCES "{{DATABASE}}"."operons" (operon_id)
);
COMMENT ON TABLE "{{DATABASE}}"."cdss" IS
  'A CDS record.';

CREATE INDEX cdss_locus_id_idx ON "{{DATABASE}}"."cdss" (locus_id);
CREATE INDEX cdss_locus_tag_idx ON "{{DATABASE}}"."cdss" (locus_tag);
