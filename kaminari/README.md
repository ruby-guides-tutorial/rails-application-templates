# Kaminari

|本期版本| 上期版本
|:---:|:---:
`Mon Dec 13 13:09:34 CST 2021` | -

## JBuilder

> [Rendering paginated pages in JBuilder views](https://stackoverflow.com/questions/63648869/rendering-paginated-pages-in-jbuilder-views)

```
json.data @buckets do |bucket|
  json.(bucket, :channel, :mdl, :sn, :version, :archived_at, :created_at)
end
json.meta do
  json.total_page @buckets.total_pages
  json.total_count @buckets.total_count
end
``` 

## Ref

* [https://github.com/kaminari/kaminari](https://github.com/kaminari/kaminari)
* [谈谈 Rails 中的分页 - 简易版](https://ruby-china.org/topics/41094)