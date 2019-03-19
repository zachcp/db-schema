CREATE TABLE "{{DATABASE}}"."clusterblast_hits" (
    clusterblast_hit_id	serial NOT NULL,
    rank	int4,
    acc	text,
    description	text,
    similarity	int4,
    algorithm_id	int4,
    bgc_id	int4,
    CONSTRAINT clusterblast_hits_pkey PRIMARY KEY (clusterblast_hit_id),
    CONSTRAINT clusterblast_hits_algorithm_id_fkey FOREIGN KEY (algorithm_id) REFERENCES "{{DATABASE}}"."clusterblast_algorithms" (algorithm_id),
    CONSTRAINT clusterblast_hits_bgc_id_fkey FOREIGN KEY (bgc_id) REFERENCES "{{DATABASE}}"."biosynthetic_gene_clusters" (bgc_id) ON DELETE CASCADE
);

COMMENT ON TABLE "{{DATABASE}}"."clusterblast_hits" IS
  'ClusterBlast hit storage, also for Sub- and KnownClusterblast.';

CREATE INDEX clusterblast_hits_bgc_id_rank_algorithm_id_idx ON "{{DATABASE}}"."clusterblast_hits" (bgc_id, rank, algorithm_id);
