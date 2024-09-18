#' Herbert River Water Quality Dataset
#'
#' This dataset contains water quality parameters from 7 sites in the Herbert River, located in Queensland, Australia, which flows into the Great Barrier Reef. It includes water level, precipitation, and total suspended solids (TSS), collected across different locations and times.
#' @docType data
#' @name herbert
#' @usage herbert
#' @export herbert
#' @format A data frame with multiple rows and 21 variables:
#' \describe{
#'   \item{date_time}{The date and time when the measurement was recorded. Format: YYYY-MM-DD HH:MM:SS.}
#'   \item{date}{The date/time id when the measurement was recorded.}
#'   \item{wqi_id}{The unique identifier for each water quality monitoring site.}
#'   \item{locID}{The unique identifier for each location where the measurements were taken.}
#'   \item{pid}{The unique point identifier, representing specific measurement points within a location.}
#'   \item{lat}{The latitude coordinate of the measurement location.}
#'   \item{lon}{The longitude coordinate of the measurement location.}
#'   \item{lev}{The water level at the time of measurement, recorded in meters.}
#'   \item{lev_type}{The type of water level measurement.}
#'   \item{lev_label}{The quality label assigned to the water level data by a water quality specialist, indicating the reliability of the data.}
#'   \item{prec}{The amount of precipitation recorded, in millimeters.}
#'   \item{quality_prec}{The quality indicator of the precipitation data, representing the accuracy and reliability of the measurement.}
#'   \item{label}{A general label for water level, providing additional context.}
#'   \item{level_i_st}{The standardized water level, adjusted to a common scale.}
#'   \item{cluster_group}{The cluster membership assigned using the DTW method, used for grouping similar sites.}
#'   \item{state_mult}{The cluster membership representing different states of baseflow and events using the HMM method, indicating various hydrological conditions.}
#'   \item{tur}{The TSS (Total Suspended Solids).}
#'   \item{ltur}{The logarithmically transformed value of TSS.}
#'   \item{tur_type}{The type of TSS measurement.}
#'   \item{tur_label}{The quality label assigned to the TSS data by experts (ground truth), indicating the reliability of the measurements.}
#'   \item{tur_indicator}{The binary indicator for turbidity/TSS, obtained/predicted using a spatio-temporal model.}
#' }
#' @description
#' We thank Cameron Roberts from the Department of Environment, Science and Innovation for producing the TSS labels.
#' @source {Santos-Fernandez, Edgar, et al. (2024). Unsupervised anomaly detection in spatio-temporal stream network sensor data. arXiv preprint arXiv:2409.07667.}
#' @keywords datasets
#' @examples
#' head(herbert)
#' library(ggplot2)
#' library(dplyr)
#' library(RColorBrewer)
#' # Turbidity (TSS) anomalies (labels / ground truth)
#' cols <- c('gray', brewer.pal(8, 'Set1'))
#' herbert %>%
#'   ggplot(.) +
#'   geom_point(aes(x = date_time, y = tur, col = factor(tur_label)), size = 0.5) +
#'   facet_wrap(~locID, nrow = 5, scales = 'free_y') +
#'   scale_x_datetime(breaks = 'months') +
#'   scale_color_manual(values = cols) +
#'   ylab('standardized level [m]') +
#'   xlab('') +
#'   theme_bw() +
#'   theme(axis.text.x = element_text(angle = 45, vjust = 0.5, hjust=1),
#'         legend.title=element_blank()) +
#'   ggtitle('')
#'
#' # Predicted turbidity (TSS) anomalies identified using the Bayesian spatio-temporal model
#' herbert %>%
#'   ggplot(.) +
#'   geom_point(aes(x = date_time, y = tur, col = factor(tur_indicator)), size = 0.5) +
#'   facet_wrap(~locID, nrow = 5, scales = 'free_y') +
#'   scale_x_datetime(breaks = 'months') +
#'   scale_color_manual(values = cols) +
#'   ylab('standardized level [m]') +
#'   xlab('') +
#'   theme_bw() +
#'   theme(axis.text.x = element_text(angle = 45, vjust = 0.5, hjust=1),
#'         legend.title=element_blank()) +
#'   ggtitle('')
#'
#' # Water level events (ambient vs event)
#' herbert %>%
#'   ggplot(.) +
#'   geom_point(aes(x = date_time, y = level_i_st, col = factor(state_mult)), size = 0.5) +
#'   facet_wrap(~locID, nrow = 5, scales = 'free_y') +
#'   scale_x_datetime(breaks = 'months') +
#'   scale_color_manual(values = cols) +
#'   ylab('standardized level [m]') +
#'   xlab('') +
#'   theme_bw() +
#'   theme(axis.text.x = element_text(angle = 45, vjust = 0.5, hjust=1),
#'         legend.title=

