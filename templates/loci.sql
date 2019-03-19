CREATE TABLE "{{DATABASE}}"."loci" (
    locus_id	serial NOT NULL,
    start_pos	int4,
    end_pos	int4,
    strand	char(1),
    sequence_id	int4,
    CONSTRAINT loci_pkey PRIMARY KEY (locus_id),
    CONSTRAINT loci_sequence_id_fkey FOREIGN KEY (sequence_id) REFERENCES "{{DATABASE}}"."dna_sequences" (sequence_id) ON DELETE CASCADE
);

CREATE INDEX loci_start_end_range_idx ON "{{DATABASE}}"."loci" USING GIST (int4range(start_pos, end_pos));
CREATE INDEX loci_start_end_strand_idx ON "{{DATABASE}}"."loci" (start_pos, end_pos, strand);
