CREATE TABLE "{{DATABASE}}"."isolates"
(
  isolate_id	serial NOT NULL,
  sample_id	int4,
  CONSTRAINT isolates_pkey PRIMARY KEY (isolate_id),
  CONSTRAINT isolates_sample_id_fkey FOREIGN KEY (sample_id) REFERENCES "{{DATABASE}}"."samples" (sample_id)
);
COMMENT ON TABLE "{{DATABASE}}"."isolates"
  IS 'A single biological isolate, sample or strain';
