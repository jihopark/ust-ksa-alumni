# @cjsx React.DOM

@SelectTags = React.createClass
  displayName: 'SelectTags'
  majors: []
  industries: []
  getInitialState: ->
    didFetchData: false;
    loadingMessage: "Loading Data..."
    select: @props.select
  componentDidMount: ->
    @_fetchData({})
  _fetchData: (data)->
    $.ajax
      url:
        '/majors'
      dataType: 'json'
      data: data
    .done @_fetchMajorDataDone
    .fail @_fetchDataFail
  _fetchMajorDataDone: (data, textStatus, jqXHR) ->
    @majors = data.majors
    @_fetchIndustryData({})
  _fetchDataFail: () ->
    @setState
      loadingMessage: "Something went wrong. Refresh Page Please"
  _fetchIndustryData: (data)->
    $.ajax
      url:
        '/industries'
      dataType: 'json'
      data: data
    .done @_fetchIndustryDataDone
    .fail @_fetchDataFail
  _fetchIndustryDataDone: (data, textStatus, jqXHR) ->
    @industries = data.industries
    @setState
      didFetchData: true
  onClickIndustry: (event) ->
    @setState
      select: "industry"
  onClickMajor: (event) ->
    @setState
      select: "major"
  onCheckBoxChange: (item, value, select) ->
    if value
      @props.addSelected(item, select)
    else
      @props.removeSelected(item, select)
  render: ->
    <div className="select_tags">
      <SelectTagsHeader className="SelectTagsHeader"
      select={@state.select}
      onClickMajor={@onClickMajor} onClickIndustry={@onClickIndustry} />

      <ul>
        {
          if @state.didFetchData
            if @state.select == "major"
              data = @majors
            else if @state.select == "industry"
              data = @industries

            for item in data
              <SelectTag key={item.id} item={item}
              select={@state.select}
              onCheckBoxChange={@onCheckBoxChange}
               />
          else
            @state.loadingMessage
        }
      </ul>
    </div>
