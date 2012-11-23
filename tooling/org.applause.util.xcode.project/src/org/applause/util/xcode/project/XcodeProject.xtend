package org.applause.util.xcode.project

import org.applause.util.xcode.projectfile.pbxproj.PbxprojFactory
import org.applause.util.xcode.projectfile.pbxproj.Project

import static extension org.applause.util.xcode.project.XcodeProjectUtils.*
import org.applause.util.xcode.projectfile.pbxproj.Language
import org.applause.util.xcode.projectfile.pbxproj.ProjectModel
import org.applause.util.xcode.projectfile.pbxproj.Encoding
import org.applause.util.xcode.projectfile.PbxprojStandaloneSetup
import org.eclipse.xtext.resource.XtextResourceSet
import org.eclipse.emf.common.util.URI
import org.eclipse.xtext.serializer.ISerializer
import org.eclipse.xtext.resource.SaveOptions

import static extension org.applause.util.xcode.project.XcodeGroup.*
import static extension org.applause.util.xcode.project.XcodeTarget.*
import static extension org.applause.util.xcode.project.XcodeBuildPhase.*
import com.google.inject.Injector

import static extension org.applause.util.xcode.project.XcodeBuildConfigurationList.*
import org.eclipse.emf.ecore.resource.Resource

class XcodeProject {
	@Property ProjectModel pbx_projectModel
	@Property Project pbx_project
	XcodeBuildConfigurationList buildConfigurationList
	String projectPath
	
	def static createProject(String path) {
		new XcodeProject(path)
	}
	
	def static createProject() {
		new XcodeProject()
	}
	
	private new() {
		this("") 
	}
	
	private new(String path) {
		projectPath = path
		
		pbx_project = PbxprojFactory::eINSTANCE.createProject
		pbx_project.name = generateUUID
		pbx_project.isa = 'PBXProject';
		pbx_project.lastupgradeCheck = 440
		pbx_project.organisationName = 'John Doe'
		// project.buildConfigurationList
		pbx_project.compatibilityVersion = 'Xcode 3.2'
		pbx_project.developmentRegion = Language::ENGLISH
		pbx_project.hasScannedForEncodings = 0
		pbx_project.knownRegions.add('en')
		pbx_project.projectDirPath = ''
		pbx_project.projectRoot = ''
		
		pbx_projectModel = PbxprojFactory::eINSTANCE.createProjectModel
		pbx_projectModel.archiveVersion = 1
		pbx_projectModel.objectVersion = 42
		pbx_projectModel.encoding = Encoding::UTF8
		pbx_projectModel.objects.add(pbx_project)
		pbx_projectModel.rootObject = pbx_project
		resource()	
		
		buildConfigurationList = this.createBuildConfigurationList()
//		buildConfigurationList.createBuildConfiguration('Release')
//		buildConfigurationList.createBuildConfiguration('Debug')
		buildConfigurationList.defaultConfigurationName = 'Release'
		pbx_project.buildConfigurationList = buildConfigurationList.pbx_BuildConfigurationList
	}
	
	Resource resource
	def private resource() {
		if (resource == null) {
			resource = resourceSet.createResource(URI::createFileURI(pbxProjectFileName) );
			resource.contents.add(pbx_projectModel)
		}
		resource		
	}
	
	Injector _injector
	def getInjector() {
		if (_injector == null) {
			_injector = new PbxprojStandaloneSetup().createInjectorAndDoEMFRegistration();
		}
		_injector
	}
	
	
	// TODO: http://www.eclipse.org/forums/index.php/m/655755/
	// use the corresponding IProject and an XtextResourceSetProvider in order to get an XtextResuoreSet
	// Do we need to make sure this runs in and out of Eclipse????  
	XtextResourceSet _resourceSet
	def getResourceSet() {
		if (_resourceSet == null) {
			_resourceSet = injector.getInstance(typeof(XtextResourceSet))
		}
		_resourceSet
	}
	
	override toString() {
		resource()
		val serializer = injector.getInstance(typeof(ISerializer))
		val out = serializer.serialize(pbx_projectModel, SaveOptions::newBuilder.format.noValidation.options)
		out
	}
	
	def save() {
		resource().save(null);
	}
	
	def String pbxProjectFileName() {
		projectPath + '/project.pbxproj'
	}
	
	def createMainGroup() {
		createMainGroup(this)
	}
	
	def createTarget(String name) {
		createTarget(this, name)
	}
	
	def createApplicationTarget(String name) {
		createApplicationTarget(this, name)
	}
	
	def createApplicationTarget(String name, XcodeFile applicationFile) {
		createApplicationTarget(this, name, applicationFile)
	}		
	
	def createSourceBuildPhase() {
		createSourceBuildPhase(this)
	}
	
	def createBuildConfiguration(String name) {
		buildConfigurationList.createBuildConfiguration(name)
	}
	
	def getBuildConfiguration(String name) {
		buildConfigurationList.getBuildConfiguration(name)
	}
	
	
}