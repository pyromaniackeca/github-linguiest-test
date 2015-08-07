class TestController < ApplicationController

  def php
     filters = [HTML::Pipeline::MarkdownFilter,
                HTML::Pipeline::SyntaxHighlightFilter]

     pipeline = HTML::Pipeline.new(filters, :gfm => false)

     php_code = <<-PHP_CODE
```php
class FeatureContext implements Context, SnippetAcceptingContext
```
     PHP_CODE

     @text = pipeline.call(php_code)[:output].to_html.html_safe
  end

end
