CREATE TABLE "{{DATABASE}}"."clusterblast_algorithms" (
    algorithm_id	serial NOT NULL,
    name	text,
    CONSTRAINT clusterblast_algorithms_pkey PRIMARY KEY (algorithm_id)
);


COMMENT ON TABLE "{{DATABASE}}"."clusterblast_algorithms" IS
  'Available *ClusterBlast algorithms';

INSERT INTO "{{DATABASE}}"."clusterblast_algorithms" (name) VALUES
    ('clusterblast'), ('knownclusterblast'), ('subclusterblast');
