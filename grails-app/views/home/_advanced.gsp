<%@ page import="au.org.ala.biocache.hubs.FacetsName; org.apache.commons.lang.StringUtils" contentType="text/html;charset=UTF-8" %>
<form name="advancedSearchForm" id="advancedSearchForm" action="${request.contextPath}/advancedSearch" method="POST">
    <input type="text" id="solrQuery" name="q" style="position:absolute;left:-9999px;" value="${params.q}"/>
    <input type="hidden" name="nameType" value="matched_name_children"/>
    <b><g:message code="advancedsearch.section.fulltext" default="Find records that have"/></b>
    <table border="0" width="100" cellspacing="2" class="compact">
        <thead/>
        <tbody>
        <tr>
            <td class="labels"><g:message code="advancedsearch.fulltext.title" default="ALL of these words (full text)"/></td>
            <td>
                <input type="text" name="text" id="text" class="dataset" placeholder="" size="80" value="${params.text}"/>
            </td>
        </tr>
        </tbody>
    </table>
    <b><g:message code="advancedsearch.section.taxon" default="Find records for ANY of the following pest taxa (matched/processed taxon concepts)"/></b>
    <table border="0" width="100" cellspacing="2" class="compact">
        <thead/>
        <tbody>
        <g:each in="${1..4}" var="i">
            <g:set var="lsidParam" value="lsid_${i}"/>
            <tr style="" id="taxon_row_${i}">
                <td class="labels"><g:message code="advancedsearch.taxon.title" default="Species/Taxon"/></td>
                <td>
                    <input type="text" value="" id="taxa_${i}" name="taxonText" class="name_autocomplete" size="60">
                    <input type="hidden" name="lsid" class="lsidInput" id="taxa_${i}" value=""/>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>
    <b><g:message code="advancedsearch.section.scientificname" default="Find records that specify the following pest scientific name (verbatim/unprocessed name)"/></b>
    <table border="0" width="100" cellspacing="2" class="compact">
        <thead/>
        <tbody>
        <tr>
            <td class="labels"><g:message code="advancedsearch.scientificname.title" default="Raw Scientific Name"/></td>
            <td>
                <input type="text" name="raw_taxon_name" id="raw_taxon_name" class="dataset" placeholder="" size="60" value=""/>
            </td>
        </tr>
        </tbody>
    </table>
    <b><g:message code="advancedsearch.section.group" default="Find records from the following pest species group"/></b>
    <table border="0" width="100" cellspacing="2" class="compact">
        <thead/>
        <tbody>
        <tr>
            <td class="labels"><g:message code="advancedsearch.group.title" default="Species Group"/></td>
            <td>
                <select class="species_group" name="species_group" id="species_group">
                    <option value=""><g:message code="advancedsearch.group.option.label" default="-- select a species group --"/></option>
                    <g:each var="group" in="${request.getAttribute(FacetsName.SPECIES_GROUP.fieldname)}">
                        <option value="${group.key}">${group.value}</option>
                    </g:each>
                </select>
            </td>
        </tr>
        </tbody>
    </table>
    <b><g:message code="advancedsearch.host_name" default="Find records that specify the following host name (verbatim/unprocessed name)"/></b>
    <table border="0" width="100" cellspacing="2" class="compact">
        <thead/>
        <tbody>
        <tr>
            <td class="labels"><g:message code="advancedsearch.host_name.title" default="Host Name"/></td>
            <td>
                <input type="text" name="host_name" id="host_name" class="dataset" placeholder="" size="60" value=""/>
            </td>
        </tr>
        </tbody>
    </table>
    <b><g:message code="advancedsearch.section.region" default="Find records from the following regions"/></b>
    <table border="0" width="100" cellspacing="2" class="compact">
        <thead/>
        <tbody>
        <tr>
            <td class="labels"><g:message code="advancedsearch.country.title" default="Country"/></td>
            <td>
                <select class="country" name="country" id="country">
                    <option value=""><g:message code="advancedsearch.country.option.label" default="-- select a country --"/></option>
                    <g:each var="country" in="${request.getAttribute(FacetsName.COUNTRIES.fieldname)}">
                        <option value="${country.key}">${country.value}</option>
                    </g:each>
                </select>
            </td>
        </tr>
        <tr>
            <td class="labels"><g:message code="advancedsearch.state.title" default="State/Territory"/></td>
            <td>
                <select class="state" name="state" id="state">
                    <option value=""><g:message code="advancedsearch.state.option.label" default="-- select a state/territory --"/></option>
                    <g:each var="state" in="${request.getAttribute(FacetsName.STATES.fieldname)}">
                        <option value="${state.key}">${state.value}</option>
                    </g:each>
                </select>
            </td>
        </tr>
        </tbody>
    </table>
    <b><g:message code="advancedsearch.section.dataset" default="Find records with the following dataset fields"/></b>
    <table border="0" width="100" cellspacing="2" class="compact">
        <thead/>
        <tbody>
        <tr>
            <td class="labels"><g:message code="advancedsearch.dataset.title" default="Dataset"/></td>
            <td>
		<select class="dataset" name="dataset" id="dataset">
                    <option value=""><g:message code="advancedsearch.dataset.option.label" default="-- select a dataset --"/></option>
                    <g:each var="dataset" in="${request.getAttribute(FacetsName.DATA_RESOURCE.fieldname)}">
                        <option value="${dataset.key}">${dataset.value}</option>
                    </g:each>
                </select>
            </td>
        </tr>
        <tr>
            <td class="labels"><g:message code="advancedsearch.catalogueno.title" default="Catalogue Number"/></td>
            <td>
                <input type="text" name="catalogue_number" id="catalogue_number" class="dataset" placeholder="" value=""/>
            </td>
        </tr>
        </tbody>
    </table>
    <b><g:message code="advancedsearch.section.date" default="Find records within the following year range"/></b>
    <table border="0" width="100" cellspacing="2" class="compact">
        <thead/>
        <tbody>
        <tr>
            <td class="labels">Year</td>
            <td>
                <input type="text" name="start_year" id="startYear" class="occurrence_date" placeholder="" value=""/>
                to
                <input type="text" name="end_year" id="endYear" class="occurrence_date" placeholder="" value=""/>
            </td>
        </tr>
        </tbody>
    </table>
    <input type="submit" value=<g:message code="advancedsearch.button.submit" default="Search"/> class="btn btn-primary" />
    &nbsp;&nbsp;
    <input type="reset" value="Clear all" id="clearAll" class="btn" onclick="$('input#solrQuery').val(''); $('input.clear_taxon').click(); return true;"/>
</form>
