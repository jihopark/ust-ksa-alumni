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
  isMajor: () ->
    @state.select == "major"
  isIndustry: () ->
    @state.select == "industry"
  onClickIndustry: (event) ->
    console.log "click industry"
    @setState
      select: "industry"
  onClickMajor: (event) ->
    console.log "click major"
    @setState
      select: "major"
  render: ->
    <div className="select_tags">
      <dl className="sub-nav">
        <dt>Select:</dt>
        {
          if @isMajor()
            <span>
              <dd className="active"><a href="#major">Major</a></dd>
              <dd><a href="#industry" onClick={@onClickIndustry}>Industry</a></dd>
            </span>
          else if @isIndustry()
            <span>
              <dd><a href="#major" onClick={@onClickMajor}>Major</a></dd>
              <dd className="active"><a href="#industry">Industry</a></dd>
            </span>
        }
      </dl>
      <ul>
        {
          if @state.didFetchData

            if @isMajor()
              data = @majors
            else if @isIndustry()
              data = @industries
            data.map (item) ->
              <SelectTag key={item.id} item={item} />
          else
            @state.loadingMessage
        }
      </ul>
    </div>
