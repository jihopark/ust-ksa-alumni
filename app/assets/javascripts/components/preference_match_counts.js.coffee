# @cjsx React.DOM

@PreferenceMatchCounts = React.createClass
  displayName: 'PreferenceMatchCounts'

  render: ->
    <div className="preference_match_counts">
    {
      unless @props.major_matches == 0
        <p><span className="match_count">{@props.major_matches} people</span> with these majors</p>
    }
    {
      unless @props.interested_industries_matches == 0
        <p><span className="match_count">{@props.interested_industries_matches} people</span> interested in these industries</p>
    }
    {
      unless @props.experienced_industries_matches == 0
        <p><span className="match_count">{@props.experienced_industries_matches} people</span> with experience in these industries</p>
    }
    {
      unless @props.total_matches == 0
        <p>Total <span className="match_count">{@props.total_matches} people</span> matches with your preferences</p>
    }
    </div>
