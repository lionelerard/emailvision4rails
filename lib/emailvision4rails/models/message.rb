class Emailvision4rails::Message < Emailvision4rails::Base

	attributes(
		:name,
		:subject,
    :from, 
    :from_email,		      
    :body,   		    
	  :reply_to, 
	  :reply_to_email,
		:id,
		:create_date, 
		:to,  		    
		:description, 
		:encoding, 
		:hotmail_unsub_url,
		:type,
		:hotmail_unsub_flg,
		:is_bounceback
	)

	validates_presence_of(
		:name,
		:subject,
		:from, 
		:from_email,		      
		:body,   		    
		:reply_to, 
		:reply_to_email
	)  	

	# See emv official doc
	LANG_MAPPER = {
		en: 1,
		en_us: 1,
		en_uk: 2,
		fr: 3,
		de: 4
	}.freeze

	LINK_TYPE_MAPPER = {
		link: true,
		button: false
	}.freeze

	# Validate format of email address	

	def initialize(body = "", payload = {})
		self.body = body
		payload.each do |attr, val|
			send("#{attr}=", val) if attributes.has_key?(attr.to_s)
		end
	end

	def create
		if valid?
		  run_callbacks :create do
		    self.id = api.post.message.create(:body => {:message => self.to_emv}).call
		  end
			true
		else
			false
		end
	end	

	def update
		if valid? and persisted?
			run_callbacks :update do
				api.post.message.create(:body => self.to_emv).call
			end			
		else
			false
		end
	end

	def destroy
		run_callbacks :destroy do
			self.id = api.get.message.deleteMessage(:uri => [self.id]).call
		end
		true
	end	

	# Deprecated
	def mirror_url_id
		warn "[DEPRECATION] mirror_url_id is deprecated. Use create_and_add_mirror_url instead"
		@mirror_url_id ||= create_and_add_mirror_url
	end

	# Replaces the first occurrence of &&& with 
	# [EMV LINK]ORDER[EMV /LINK] (where ORDER is the mirror link order number).
	def create_and_add_mirror_url
		api.get.url.create_and_add_mirror_url(uri: [id, 'mirror_url']).call
	end

	# Replaces the first occurrence of &&& with [EMV SHARE lang=xx]
	# Parameters :	
	# - type : :link, :button
	# - lang : :en, :fr, :de (optionnal)
	# - url : The url of the share link
	def create_and_add_share_link(type, lang, url)		
		type = LINK_TYPE_MAPPER[type.to_sym]
		lang = LANG_MAPPER[lang.to_sym]
		api.get.add_share_link(uri: [id, type, url,lang]).call
	end	

	def track_links
		emv.get.message.track_all_links(id: id).call
	end

	def persisted?
		id.present?
	end

end