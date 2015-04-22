package au.org.ala.biocache.hubs.appd

import groovy.xml.MarkupBuilder
import org.codehaus.groovy.grails.web.json.JSONObject

class OccurrenceTagLib {
    //static defaultEncodeAs = 'html'
    //static encodeAsForTags = [tagName: 'raw']
    static namespace = 'alatag'

    /**
     * Output a row (occurrence record) in the search results "Records" tab
     *
     * @attr occurrence REQUIRED
     */
    def formatListRecordRow = { attrs ->
        //log.debug "formatListRecordRow - ${session['hit']++}"
        def JSONObject occurrence = attrs.occurrence
        def mb = new MarkupBuilder(out)

        def outputResultsLabel = { label, value, test ->
            if (test) {
                mb.span(class:'resultValue') {
                    strong(class:'resultsLabel') {
                        mkp.yieldUnescaped(label)
                    }
                    mkp.yieldUnescaped(value)
                }
            }
        }

        mb.div(class:'recordRow', id:occurrence.uuid ) {
            p(class:'rowA') {
                if (occurrence.taxonRank && occurrence.scientificName) {
                    span(style:'text-transform: capitalize', occurrence.taxonRank)
                    mkp.yieldUnescaped(":&nbsp;")
                    span(class:'occurrenceNames') {
                        mkp.yieldUnescaped(alatag.formatSciName(rankId:occurrence.taxonRankID?:'6000', name:"${occurrence.scientificName}"))
                    }
                } else {
                    span(class:'occurrenceNames', occurrence.raw_scientificName)
                }
                if (occurrence.vernacularName || occurrence.raw_vernacularName) {
                    mkp.yieldUnescaped("&nbsp;|&nbsp;")
                    span(class:'occurrenceNames', occurrence.vernacularName?:occurrence.raw_vernacularName)
                }
                span(style:'margin-left: 8px;') {
                    if (occurrence.eventDate) {
                        outputResultsLabel("Date: ", g.formatDate(date: new Date(occurrence.eventDate), format:"dd-MM-yyyy"), true)
                    } else if (occurrence.occurrenceYear || occurrence.year) {
                        outputResultsLabel("Year: ", g.formatDate(number: new Date(occurrence.occurrenceYear?occurrence.occurrenceYear:occurrence.year), format:"yyyy"), true)
                    }
                    if (occurrence.stateProvince) {
                        outputResultsLabel("State: ", alatag.message(code:occurrence.stateProvince), true)
                    } else if (occurrence.country) {
                        outputResultsLabel("Country: ", alatag.message(code:occurrence.country), true)
                    }
                }
            }
            p(class:'rowB') {
                outputResultsLabel("Data&nbsp;Resource: ", alatag.message(code:occurrence.datasetName), occurrence.datasetName)
                outputResultsLabel("Life&nbsp;Stage: ", alatag.message(code:occurrence.lifeStage), occurrence.lifeStage)
                outputResultsLabel("Catalog&nbsp;number: ", "${occurrence.raw_collectionCode ? occurrence.raw_collectionCode + ':' : ''}${occurrence.raw_catalogNumber}", occurrence.raw_catalogNumber)
                a(
                        href: g.createLink(url:"${request.contextPath}/occurrences/${occurrence.uuid}"),
                        class:"occurrenceLink",
                        style:"margin-left: 15px;",
                        "View record"
                )
            }
        }
    }
}
