--- DROP TABLE "{{DATABASE}}"."samples";

CREATE TABLE "{{DATABASE}}"."samples" (
    sample_id	serial NOT NULL,
    habitat	text,
    time	text,
    site_id	int4,
    CONSTRAINT samples_pkey PRIMARY KEY (sample_id),
    CONSTRAINT samples_site_id_fkey FOREIGN KEY (site_id) REFERENCES "{{DATABASE}}"."sampling_sites" (site_id)
);
COMMENT ON TABLE "{{DATABASE}}"."samples" IS
  'A biological sample.';
