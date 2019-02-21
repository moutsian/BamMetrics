version 1.0

import "tasks/common.wdl" as common
import "tasks/picard.wdl" as picard
import "tasks/samtools.wdl" as samtools

workflow BamMetrics {
    input {
        IndexedBamFile bam
        String outputDir
        Reference reference

        File? refRefflat
        String strandedness = "None"

        Array[File]+? targetIntervals
        File? ampliconIntervals

        Map[String, String] dockerTags = {
          "samtools":"1.8--h46bd0b3_5",
          "picard":"2.18.26--0",
          "picard+r":"8dde04faba6c9ac93fae7e846af3bafd2c331b3b-0"
        }
    }

    String prefix = outputDir + "/" + basename(bam.file, ".bam")

    call samtools.Flagstat {
        input:
            inputBam = bam.file,
            outputPath = prefix + ".flagstats",
            dockerTag = dockerTags["samtools"]
    }

    call picard.CollectMultipleMetrics as picardMetrics {
        input:
            bamFile = bam,
            basename = prefix,
            reference = reference,
            dockerTag = dockerTags["picard+r"]
    }

    if (defined(refRefflat)) {
        Map[String, String] strandednessConversion = {"None": "NONE",
            "FR":"FIRST_READ_TRANSCRIPTION_STRAND", "RF": "SECOND_READ_TRANSCRIPTION_STRAND"}

        call picard.CollectRnaSeqMetrics as rnaSeqMetrics {
            input:
                bamFile = bam,
                refRefflat = select_first([refRefflat]),
                basename = prefix,
                strandSpecificity = strandednessConversion[strandedness],
                dockerTag = dockerTags["picard+r"]
        }
    }

    if (defined(targetIntervals)) {
        Array[File] targetBeds = select_first([targetIntervals])
        scatter (targetBed in targetBeds) {
            call picard.BedToIntervalList as targetIntervalsLists {
                input:
                    bedFile = targetBed,
                    outputPath =
                        prefix + "_intervalLists/" + basename(targetBed) + ".interval_list",
                    dict = reference.dict,
                    dockerTag = dockerTags["picard"]
            }
        }

        call picard.BedToIntervalList as ampliconIntervalsLists {
             input:
                 bedFile = select_first([ampliconIntervals]),
                 outputPath = prefix + "_intervalLists/" +
                    basename(select_first([ampliconIntervals])) + ".interval_list",
                 dict = reference.dict,
                 dockerTag = dockerTags["picard"]
            }

        call picard.CollectTargetedPcrMetrics as targetMetrics {
            input:
                bamFile = bam,
                reference = reference,
                basename = prefix,
                targetIntervals = targetIntervalsLists.intervalList,
                ampliconIntervals = ampliconIntervalsLists.intervalList,
                dockerTag = dockerTags["picard"]
        }
    }

    output {
    }
}
