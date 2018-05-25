/*
 * Copyright 2016-2017 the original author or authors and Joel Tobey <joeltobey@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * The root of the cfboom class hierarchy.
 *
 * @author Joel Tobey
 */
component
  displayname="Class Object"
  output="false"
{
  /**
   * Global Java Classes.
   */
  variables['Boolean'] = createObject("java","java.lang.Boolean");
  variables['Byte'] = createObject("java","java.lang.Byte");
  variables['Character'] = createObject("java","java.lang.Character");
  variables['Double'] = createObject("java","java.lang.Double");
  variables['Float'] = createObject("java","java.lang.Float");
  variables['Integer'] = createObject("java","java.lang.Integer");
  variables['Long'] = createObject("java","java.lang.Long");
  variables['Short'] = createObject("java","java.lang.Short");
  variables['String'] = createObject("java","java.lang.String");
  variables['System'] = createObject("java", "java.lang.System");

  /**
   * Private structure to hold instance variables.
   */
  variables['_instance'] = {};

  /**
   * This allows the object to have a function called 'equals'.
   */
  this['equals'] = $equals;

  /**
   * Constructor.
   */
  public cfboom.lang.Object function init() {
    return this;
  }

  /**
   * Determines if the given object is equal to this.
   */
  private boolean function $equals( any other ) {
    if (!structKeyExists(arguments, "other"))
      return false;
    if (!isInstanceOf(arguments.other, "cfboom.lang.Object"))
      return false;
    if (getIdentityHashCode() == arguments.other.getIdentityHashCode())
      return true;
    return false;
  }

  /**
   * Returns the System identityHashCode of this.
   */
  public numeric function getIdentityHashCode() {
    if (!structKeyExists(variables, "_identityHashCode")) {
      variables['_identityHashCode'] = System.identityHashCode( this );
    }
    return _identityHashCode;
  }

  /**
   * Returns a unique string to identify this object.
   */
  public string function getIdentityString() {
    if (!structKeyExists(variables, "_identityString")) {
      variables['_identityString'] = getComponentName() & "@" & Integer.toHexString( getIdentityHashCode() );
    }
    return _identityString;
  }

  /**
   * Returns the object's fullname or name as defined in the meta.
   */
  public string function getComponentName() {
    if (!structKeyExists(variables, "_componentName")) {
      var meta = getMeta();
      variables['_componentName'] = structKeyExists(meta, "fullname") ? meta.fullname : meta.name;
    }
    return _componentName;
  }

  /**
   * Returns the object's metadata.
   */
  public struct function getMeta() {
    if (!structKeyExists(variables, "_meta"))
      variables['_meta'] = getMetadata();
    return _meta;
  }

  /**
   * Returns the object's hashcode.
   */
  public numeric function hashCode() {
    return javaCast("int", 0);
  }

  /**
   * Returns a user-friendly string of the object.
   */
  public string function toString() {
    return getIdentityString();
  }

}
