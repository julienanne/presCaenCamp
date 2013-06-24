class CommentairesController < ApplicationController
  def liste_commentaires_actifs_pseudo
    @commentaires = Commentaire.liste_commentaires_actifs_pseudo(params[:pseudo])
    #render :nothing => true
    respond_to do |format|
      format.html { render :nothing => true }
      format.json { render :json => @commentaires }
    end
  end

  def valide_commentaire
    commentaire = Commentaire.find(params[:id])
    commentaire.valider
    respond_to do |format|
      format.html { redirect_to :action => "index" }
      format.json { render :json => commentaire }
    end
  end

  # GET /commentaires
  # GET /commentaires.json
  def index
    @commentaires = Commentaire.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @commentaires }
    end
  end

  # GET /commentaires/1
  # GET /commentaires/1.json
  def show
    @commentaire = Commentaire.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @commentaire }
    end
  end

  # GET /commentaires/new
  # GET /commentaires/new.json
  def new
    @commentaire = Commentaire.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @commentaire }
    end
  end

  # GET /commentaires/1/edit
  def edit
    @commentaire = Commentaire.find(params[:id])
  end

  # POST /commentaires
  # POST /commentaires.json
  def create
    @commentaire = Commentaire.new(params[:commentaire])

    respond_to do |format|
      if @commentaire.save
        format.html { redirect_to @commentaire, :notice => 'Commentaire was successfully created.' }
        format.json { render :json => @commentaire, :status => :created, :location => @commentaire }
      else
        format.html { render :action => "new" }
        format.json { render :json => @commentaire.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /commentaires/1
  # PUT /commentaires/1.json
  def update
    @commentaire = Commentaire.find(params[:id])

    respond_to do |format|
      if @commentaire.update_attributes(params[:commentaire])
        format.html { redirect_to @commentaire, :notice => 'Commentaire was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @commentaire.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /commentaires/1
  # DELETE /commentaires/1.json
  def destroy
    @commentaire = Commentaire.find(params[:id])
    @commentaire.destroy

    respond_to do |format|
      format.html { redirect_to commentaires_url }
      format.json { head :no_content }
    end
  end
end
