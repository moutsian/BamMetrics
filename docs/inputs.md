# BamMetrics


## Inputs


### Required inputs
<p name="BamMetrics.bam">
        <b>BamMetrics.bam</b><br />
        <i>File &mdash; Default: None</i><br />
        The BAM file for which metrics will be collected.
</p>
<p name="BamMetrics.bamIndex">
        <b>BamMetrics.bamIndex</b><br />
        <i>File &mdash; Default: None</i><br />
        The index for the bam file.
</p>
<p name="BamMetrics.referenceFasta">
        <b>BamMetrics.referenceFasta</b><br />
        <i>File &mdash; Default: None</i><br />
        The reference fasta file.
</p>
<p name="BamMetrics.referenceFastaDict">
        <b>BamMetrics.referenceFastaDict</b><br />
        <i>File &mdash; Default: None</i><br />
        The sequence dictionary associated with the reference fasta file.
</p>
<p name="BamMetrics.referenceFastaFai">
        <b>BamMetrics.referenceFastaFai</b><br />
        <i>File &mdash; Default: None</i><br />
        The index for the reference fasta file.
</p>

### Other common inputs
<p name="BamMetrics.ampliconIntervals">
        <b>BamMetrics.ampliconIntervals</b><br />
        <i>File? &mdash; Default: None</i><br />
        An interval list describinig the coordinates of the amplicons sequenced. This should only be used for targeted sequencing or WES. Required if `ampliconIntervals` is defined.
</p>
<p name="BamMetrics.outputDir">
        <b>BamMetrics.outputDir</b><br />
        <i>String &mdash; Default: "."</i><br />
        The directory to which the outputs will be written.
</p>
<p name="BamMetrics.refRefflat">
        <b>BamMetrics.refRefflat</b><br />
        <i>File? &mdash; Default: None</i><br />
        A refflat file containing gene annotations. If defined RNA sequencing metrics will be collected.
</p>
<p name="BamMetrics.strandedness">
        <b>BamMetrics.strandedness</b><br />
        <i>String &mdash; Default: "None"</i><br />
        The strandedness of the RNA sequencing library preparation. One of "None" (unstranded), "FR" (forward-reverse: first read equal transcript) or "RF" (reverse-forward: second read equals transcript).
</p>
<p name="BamMetrics.targetIntervals">
        <b>BamMetrics.targetIntervals</b><br />
        <i>Array[File]+? &mdash; Default: None</i><br />
        An interval list describing the coordinates of the targets sequenced. This should only be used for targeted sequencing or WES. If defined targeted PCR metrics will be collected. Requires `ampliconIntervals` to also be defined.
</p>

### Advanced inputs
<details>
<summary> Show/Hide </summary>
<p name="BamMetrics.ampliconIntervalsLists.javaXmx">
        <b>BamMetrics.ampliconIntervalsLists.javaXmx</b><br />
        <i>String &mdash; Default: "3G"</i><br />
        The maximum memory available to the program. Should be lower than `memory` to accommodate JVM overhead.
</p>
<p name="BamMetrics.ampliconIntervalsLists.memory">
        <b>BamMetrics.ampliconIntervalsLists.memory</b><br />
        <i>String &mdash; Default: "4G"</i><br />
        The amount of memory this job will use.
</p>
<p name="BamMetrics.ampliconIntervalsLists.timeMinutes">
        <b>BamMetrics.ampliconIntervalsLists.timeMinutes</b><br />
        <i>Int &mdash; Default: 5</i><br />
        The maximum amount of time the job will run in minutes.
</p>
<p name="BamMetrics.collectAlignmentSummaryMetrics">
        <b>BamMetrics.collectAlignmentSummaryMetrics</b><br />
        <i>Boolean &mdash; Default: true</i><br />
        Equivalent to the `PROGRAM=CollectAlignmentSummaryMetrics` argument in Picard.
</p>
<p name="BamMetrics.dockerImages">
        <b>BamMetrics.dockerImages</b><br />
        <i>Map[String,String] &mdash; Default: {"samtools": "quay.io/biocontainers/samtools:1.11--h6270b1f_0", "picard": "quay.io/biocontainers/picard:2.23.8--0"}</i><br />
        The docker images used. Changing this may result in errors which the developers may choose not to address.
</p>
<p name="BamMetrics.Flagstat.memory">
        <b>BamMetrics.Flagstat.memory</b><br />
        <i>String &mdash; Default: "256M"</i><br />
        The amount of memory needed for the job.
</p>
<p name="BamMetrics.Flagstat.timeMinutes">
        <b>BamMetrics.Flagstat.timeMinutes</b><br />
        <i>Int &mdash; Default: 1 + ceil(size(inputBam,"G"))</i><br />
        The maximum amount of time the job will run in minutes.
</p>
<p name="BamMetrics.meanQualityByCycle">
        <b>BamMetrics.meanQualityByCycle</b><br />
        <i>Boolean &mdash; Default: true</i><br />
        Equivalent to the `PROGRAM=MeanQualityByCycle` argument in Picard.
</p>
<p name="BamMetrics.picardMetrics.collectBaseDistributionByCycle">
        <b>BamMetrics.picardMetrics.collectBaseDistributionByCycle</b><br />
        <i>Boolean &mdash; Default: true</i><br />
        Equivalent to the `PROGRAM=CollectBaseDistributionByCycle` argument.
</p>
<p name="BamMetrics.picardMetrics.collectGcBiasMetrics">
        <b>BamMetrics.picardMetrics.collectGcBiasMetrics</b><br />
        <i>Boolean &mdash; Default: true</i><br />
        Equivalent to the `PROGRAM=CollectGcBiasMetrics` argument.
</p>
<p name="BamMetrics.picardMetrics.collectInsertSizeMetrics">
        <b>BamMetrics.picardMetrics.collectInsertSizeMetrics</b><br />
        <i>Boolean &mdash; Default: true</i><br />
        Equivalent to the `PROGRAM=CollectInsertSizeMetrics` argument.
</p>
<p name="BamMetrics.picardMetrics.collectQualityYieldMetrics">
        <b>BamMetrics.picardMetrics.collectQualityYieldMetrics</b><br />
        <i>Boolean &mdash; Default: true</i><br />
        Equivalent to the `PROGRAM=CollectQualityYieldMetrics` argument.
</p>
<p name="BamMetrics.picardMetrics.collectSequencingArtifactMetrics">
        <b>BamMetrics.picardMetrics.collectSequencingArtifactMetrics</b><br />
        <i>Boolean &mdash; Default: true</i><br />
        Equivalent to the `PROGRAM=CollectSequencingArtifactMetrics` argument.
</p>
<p name="BamMetrics.picardMetrics.javaXmxMb">
        <b>BamMetrics.picardMetrics.javaXmxMb</b><br />
        <i>Int &mdash; Default: 3072</i><br />
        The maximum memory available to the program in megabytes. Should be lower than `memoryMb` to accommodate JVM overhead.
</p>
<p name="BamMetrics.picardMetrics.memoryMb">
        <b>BamMetrics.picardMetrics.memoryMb</b><br />
        <i>Int &mdash; Default: javaXmxMb + 512</i><br />
        The amount of memory this job will use in megabytes.
</p>
<p name="BamMetrics.picardMetrics.qualityScoreDistribution">
        <b>BamMetrics.picardMetrics.qualityScoreDistribution</b><br />
        <i>Boolean &mdash; Default: true</i><br />
        Equivalent to the `PROGRAM=QualityScoreDistribution` argument.
</p>
<p name="BamMetrics.picardMetrics.timeMinutes">
        <b>BamMetrics.picardMetrics.timeMinutes</b><br />
        <i>Int &mdash; Default: 1 + ceil((size(referenceFasta,"G") * 3 * 2)) + ceil((size(inputBam,"G") * 6))</i><br />
        The maximum amount of time the job will run in minutes.
</p>
<p name="BamMetrics.rnaSeqMetrics.javaXmx">
        <b>BamMetrics.rnaSeqMetrics.javaXmx</b><br />
        <i>String &mdash; Default: "8G"</i><br />
        The maximum memory available to the program. Should be lower than `memory` to accommodate JVM overhead.
</p>
<p name="BamMetrics.rnaSeqMetrics.memory">
        <b>BamMetrics.rnaSeqMetrics.memory</b><br />
        <i>String &mdash; Default: "9G"</i><br />
        The amount of memory this job will use.
</p>
<p name="BamMetrics.rnaSeqMetrics.timeMinutes">
        <b>BamMetrics.rnaSeqMetrics.timeMinutes</b><br />
        <i>Int &mdash; Default: 1 + ceil((size(inputBam,"G") * 12))</i><br />
        The maximum amount of time the job will run in minutes.
</p>
<p name="BamMetrics.targetIntervalsLists.javaXmx">
        <b>BamMetrics.targetIntervalsLists.javaXmx</b><br />
        <i>String &mdash; Default: "3G"</i><br />
        The maximum memory available to the program. Should be lower than `memory` to accommodate JVM overhead.
</p>
<p name="BamMetrics.targetIntervalsLists.memory">
        <b>BamMetrics.targetIntervalsLists.memory</b><br />
        <i>String &mdash; Default: "4G"</i><br />
        The amount of memory this job will use.
</p>
<p name="BamMetrics.targetIntervalsLists.timeMinutes">
        <b>BamMetrics.targetIntervalsLists.timeMinutes</b><br />
        <i>Int &mdash; Default: 5</i><br />
        The maximum amount of time the job will run in minutes.
</p>
<p name="BamMetrics.targetMetrics.javaXmx">
        <b>BamMetrics.targetMetrics.javaXmx</b><br />
        <i>String &mdash; Default: "3G"</i><br />
        The maximum memory available to the program. Should be lower than `memory` to accommodate JVM overhead.
</p>
<p name="BamMetrics.targetMetrics.memory">
        <b>BamMetrics.targetMetrics.memory</b><br />
        <i>String &mdash; Default: "4G"</i><br />
        The amount of memory this job will use.
</p>
<p name="BamMetrics.targetMetrics.timeMinutes">
        <b>BamMetrics.targetMetrics.timeMinutes</b><br />
        <i>Int &mdash; Default: 1 + ceil((size(inputBam,"G") * 6))</i><br />
        The maximum amount of time the job will run in minutes.
</p>
</details>








<hr />

> Generated using WDL AID (0.1.1)
