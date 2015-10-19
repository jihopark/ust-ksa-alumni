@JobPostListItem = React.createClass
  displayName: 'JobPostListItem'
  getClassName: () ->
    if @props.isCurrentPost
      "job_posts_list current_post"
    else
      "job_posts_list"
  handleClick: (event) ->
    console.log "clicked " + @props.post.title
    @props.changeCurrentPost(@props.post.id)
  render: ->
    <div className={@getClassName()} onClick={@handleClick}>
      <h5>{@props.post.title}</h5>
      <div className="right">Until {@props.post.expire_date}</div>
    </div>
