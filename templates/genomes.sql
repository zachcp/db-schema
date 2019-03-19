CREATE TABLE "{{DATABASE}}"."genomes" (
    genome_id	serial NOT NULL,
    tax_id	int4,
    bio_project	text,
    bio_sample	text,
    isolate_id	int4,
    assembly_id	text,
    CONSTRAINT genomes_pkey PRIMARY KEY (genome_id),
    CONSTRAINT genomes_tax_id_fkey FOREIGN KEY (tax_id) REFERENCES "{{DATABASE}}"."taxa" (tax_id) ON DELETE CASCADE,
    CONSTRAINT genomes_isolate_id_fkey FOREIGN KEY (isolate_id) REFERENCES "{{DATABASE}}"."isolates" (isolate_id) ON DELETE CASCADE
);
COMMENT ON TABLE "{{DATABASE}}"."genomes" IS
    'Information on a genome';
