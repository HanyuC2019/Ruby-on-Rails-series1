class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  # def create
  #   Contact.create(contact_params)
  #   redirect_to new_contact_path
  # end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
      redirect_to contacts_path, notice: "問い合わせしました！"
    else
      # 入力フォームを再描画します。
      render :new
    end
  end

  def show
    @contact =Contact.find(params[:id])
  end

  def edit
    @contact =Contact.find(params[:id])
  end

  def update
    @contact =Contact.find(params[:id])
    if @contact.update(contact_params)
      redirect_to contacts_path, notice: "編集済み"
    else
      render :edit
    end
  end


  private

  def contact_params
    params.require(:contact).permit(:name, :email, :content)
  end
end
