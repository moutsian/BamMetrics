/*
 * Copyright (c) 2018 Biowdl
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to
 * use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
 * the Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 * IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

package biowdl.test

import nl.biopet.utils.biowdl.PipelineSuccess

trait BamMetricsSuccess extends BamMetrics with PipelineSuccess {
  addMustHaveFile(prefix + ".flagstats")
  addMustHaveFile(prefix + ".alignment_summary_metrics")
  addMustHaveFile(prefix + ".bait_bias_detail_metrics")
  addMustHaveFile(prefix + ".bait_bias_summary_metrics")
  addMustHaveFile(prefix + ".base_distribution_by_cycle_metrics")
  addMustHaveFile(prefix + ".base_distribution_by_cycle.pdf")
  addMustHaveFile(prefix + ".error_summary_metrics")
  addMustHaveFile(prefix + ".gc_bias.detail_metrics")
  addMustHaveFile(prefix + ".gc_bias.pdf")
  addMustHaveFile(prefix + ".gc_bias.summary_metrics")
  addMustHaveFile(prefix + ".insert_size_histogram.pdf")
  addMustHaveFile(prefix + ".insert_size_metrics")
  addMustHaveFile(prefix + ".pre_adapter_detail_metrics")
  addMustHaveFile(prefix + ".pre_adapter_summary_metrics")
  addMustHaveFile(prefix + ".quality_by_cycle_metrics")
  addMustHaveFile(prefix + ".quality_by_cycle.pdf")
  addMustHaveFile(prefix + ".quality_distribution_metrics")
  addMustHaveFile(prefix + ".quality_distribution.pdf")
  addMustHaveFile(prefix + ".quality_yield_metrics")

  if (rna) {
    addMustHaveFile(prefix + ".RNA_Metrics.pdf")
    addMustHaveFile(prefix + ".RNA_Metrics")
  }

  if (targetIntervals.isDefined) {
    addMustHaveFile(prefix + ".targetPcrPerTargetCoverage")
    addMustHaveFile(prefix + ".targetPcrPerBaseCoverage")
    addMustHaveFile(prefix + ".targetPcrMetrics")
  }
}
