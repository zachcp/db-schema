CREATE TABLE "{{DATABASE}}"."tta_codons" (
    tta_codon_id	serial NOT NULL,
    locus_id	int4,
    CONSTRAINT tta_codon_pkey PRIMARY KEY (tta_codon_id),
    CONSTRAINT tta_codon_locus_id_fkey FOREIGN KEY (locus_id) REFERENCES "{{DATABASE}}"."loci" (locus_id) ON DELETE CASCADE
);
COMMENT ON TABLE "{{DATABASE}}"."tta_codons" IS
  'A TTA codon record.';

CREATE INDEX tta_codon_locus_id_idx ON "{{DATABASE}}"."tta_codons" (locus_id);
