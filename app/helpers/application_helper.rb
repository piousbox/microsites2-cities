
module ApplicationHelper

  def pretty_date input
    return input.strftime("%Y-%M-%d")
  end

  def adserv
    true
  end
  
  def admin_path
    '/admin'
  end
  
  def second_tag_path t
    return "/tags/view/#{t[:name_seo]}" unless t[:name_seo].blank?
    
    "/tags/#{t.to_param}"
  end
  
  def search_path
    '/search'
  end
  
  def manager_path
    '/manager'
  end
  
  def image_doc
    image_tag 'icons/32x32/doc.png'
  end
  
  def image_pdf
    image_tag 'icons/32x32/pdf.png'
  end
  
  def image_linkedin
    image_tag 'icons/32x32/linkedin.png'
  end
  
  def image_facebook
    image_tag 'icons/32x32/facebook.png'
  end
  
  def image_twitter
    image_tag 'icons/32x32/twitter.png'
  end
  
  def image_github
    image_tag 'icons/32x32/github.png'
  end
  
  def image_email
    image_tag 'icons/32x32/email.png'
  end
  
  def github_path
    'http://github.com/piousbox'
  end
  
  def linkedin_path
    'http://linkedin.com'
  end
  
  def facebook_path
    'http://facebook.com/piousbox'
  end
  
  def team_path
    "http://computationalartscorp.com/team"
  end
  
  def blog_path
    "http://infiniteshelter.com/tags/show/Computational_Arts_Corp"
  end
  
  def twitter_path
    'http://twitter.com/piousbox'
  end
  
end

