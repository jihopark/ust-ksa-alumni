# @cjsx React.DOM

@SelectTags = React.createClass
  displayName: 'SelectTags'
  majors: []
  industries: []
  getInitialState: ->
    didFetchData: false
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
  isSelected: (item, select) ->
    if select == "major"
      return @itemContains(@props.selected_majors, item)
    else if select == "industry"
      return @itemContains(@props.selected_industries, item)
    return false
  itemContains: (array, item) ->
    for i in array
      if i.id == item.id
        return true
    return false
  render: ->
    <div className="select_tags">
      <SelectTagsHeader className="SelectTagsHeader"
      select={@state.select}
      onClickMajor={@onClickMajor} onClickIndustry={@onClickIndustry} />

      <ul className="tags_list">
        {
          if @state.didFetchData
            if @state.select == "major"
              data = @majors
            else if @state.select == "industry"
              data = @industries

            for item in data
              if @state.select == "major"
                key = item.id
              else
                key = item.id*1000

              <SelectTag key={key} item={item}
              select={@state.select}
              checked={@isSelected(item, @state.select)}
              onCheckBoxChange={@onCheckBoxChange}
               />
          else
            @state.loadingMessage
        }
      </ul>
    </div>
