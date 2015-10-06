# @cjsx React.DOM

@SelectTags = React.createClass
  displayName: 'SelectTags'
  getInitialState: ->
    select: @props.select
  render: ->
    <div className="select_tags">
      <dl className="sub-nav">
        <dt>Select:</dt>
        {
          if @state.select == "major"
            <span>
              <dd className="active"><a href="#">Major</a></dd>
              <dd><a href="#">Industry</a></dd>
            </span>
          else if @state.select == "industry"
            <span>
              <dd><a href="#">Major</a></dd>
              <dd className="active"><a href="#">Industry</a></dd>
            </span>
        }
      </dl>
      <ul>
        {
          @props.data.map (item) ->
            <SelectTag key={item.id} item={item} />
        }
      </ul>
    </div>
