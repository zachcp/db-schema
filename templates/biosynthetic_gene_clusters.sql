CREATE TABLE "{{DATABASE}}"."biosynthetic_gene_clusters" (
    bgc_id	serial NOT NULL,
    cluster_number	int4,
    locus_id	int4,
    evidence_id	int4,
    CONSTRAINT biosynthetic_gene_clusters_pkey PRIMARY KEY (bgc_id),
    CONSTRAINT biosynthetic_gene_clusters_locus_id_fkey FOREIGN KEY (locus_id) REFERENCES "{{DATABASE}}"."loci" (locus_id) ON DELETE CASCADE,
    CONSTRAINT biosynthetic_gene_clusters_evidence_id_fkey FOREIGN KEY (evidence_id) REFERENCES "{{DATABASE}}"."evidences" (evidence_id)
);

COMMENT ON TABLE "{{DATABASE}}"."biosynthetic_gene_clusters" IS
  'A biosynthetic gene cluster as predicted by antiSMASH.';

CREATE INDEX biosynthetic_gene_clusters_locus_id_idx ON "{{DATABASE}}"."biosynthetic_gene_clusters" (locus_id);
