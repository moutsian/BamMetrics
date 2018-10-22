version 1.0

import "tasks/picard.wdl" as picard
import "tasks/samtools.wdl" as samtools
import "tasks/biopet/bamstats.wdl" as bamstats
import "tasks/common.wdl" as common
import "tasks/biopet/bamstats.wdl" as bamstats

workflow BamMetrics {
    input {
        IndexedBamFile bam
        String outputDir
        Reference reference

        File? refRefflat
        String strandedness = "None"

        Array[File]+? targetIntervals
        File? ampliconIntervals
    }

    String prefix = outputDir + "/" + basename(bam.file, ".bam")

    call samtools.Flagstat {
        input:
            inputBam = bam.file,
            outputPath = prefix + ".flagstats"
    }

    call bamstats.Generate {
        input:
            bam = bam,
            outputDir = prefix + ".bamstats",
            reference = reference,
            tsvOutputs = true
    }

    call picard.CollectMultipleMetrics as picardMetrics {
        input:
            bamFile = bam,
            basename = prefix,
            reference = reference
    }

    if (defined(refRefflat)) {
        Map[String, String] strandednessConversion = {"None": "NONE",
            "FR":"FIRST_READ_TRANSCRIPTION_STRAND", "RF": "SECOND_READ_TRANSCRIPTION_STRAND"}

        call picard.CollectRnaSeqMetrics as rnaSeqMetrics {
            input:
                bamFile = bam,
                refRefflat = select_first([refRefflat]),
                basename = prefix,
                strandSpecificity = strandednessConversion[strandedness]
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
                    dict = reference.dict
            }
        }

        call picard.BedToIntervalList as ampliconIntervalsLists {
             input:
                 bedFile = select_first([ampliconIntervals]),
                 outputPath = prefix + "_intervalLists/" +
                    basename(select_first([ampliconIntervals])) + ".interval_list",
                 dict = reference.dict
            }

        call picard.CollectTargetedPcrMetrics as targetMetrics {
            input:
                bamFile = bam,
                reference = reference,
                basename = prefix,
                targetIntervals = targetIntervalsLists.intervalList,
                ampliconIntervals = ampliconIntervalsLists.intervalList
        }
    }

    output {
    }
}
