/**
 * <copyright>
 * </copyright>
 *
 */
package de.itemis.mobilizer.appModelDsl;


/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Object Reference</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * <ul>
 *   <li>{@link de.itemis.mobilizer.appModelDsl.ObjectReference#getObject <em>Object</em>}</li>
 *   <li>{@link de.itemis.mobilizer.appModelDsl.ObjectReference#getTail <em>Tail</em>}</li>
 * </ul>
 * </p>
 *
 * @see de.itemis.mobilizer.appModelDsl.AppModelDslPackage#getObjectReference()
 * @model
 * @generated
 */
public interface ObjectReference extends Expression, ScalarExpression, CollectionExpression
{
  /**
   * Returns the value of the '<em><b>Object</b></em>' reference.
   * <!-- begin-user-doc -->
   * <p>
   * If the meaning of the '<em>Object</em>' reference isn't clear,
   * there really should be more of a description here...
   * </p>
   * <!-- end-user-doc -->
   * @return the value of the '<em>Object</em>' reference.
   * @see #setObject(VariableDeclaration)
   * @see de.itemis.mobilizer.appModelDsl.AppModelDslPackage#getObjectReference_Object()
   * @model
   * @generated
   */
  VariableDeclaration getObject();

  /**
   * Sets the value of the '{@link de.itemis.mobilizer.appModelDsl.ObjectReference#getObject <em>Object</em>}' reference.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @param value the new value of the '<em>Object</em>' reference.
   * @see #getObject()
   * @generated
   */
  void setObject(VariableDeclaration value);

  /**
   * Returns the value of the '<em><b>Tail</b></em>' containment reference.
   * <!-- begin-user-doc -->
   * <p>
   * If the meaning of the '<em>Tail</em>' containment reference isn't clear,
   * there really should be more of a description here...
   * </p>
   * <!-- end-user-doc -->
   * @return the value of the '<em>Tail</em>' containment reference.
   * @see #setTail(ObjectReference)
   * @see de.itemis.mobilizer.appModelDsl.AppModelDslPackage#getObjectReference_Tail()
   * @model containment="true"
   * @generated
   */
  ObjectReference getTail();

  /**
   * Sets the value of the '{@link de.itemis.mobilizer.appModelDsl.ObjectReference#getTail <em>Tail</em>}' containment reference.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @param value the new value of the '<em>Tail</em>' containment reference.
   * @see #getTail()
   * @generated
   */
  void setTail(ObjectReference value);

} // ObjectReference
